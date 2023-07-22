pragma circom 2.0.0;


template MyAwesomeCircuit () {  

   // input signal  
   signal input a;  
   signal input b;

   // gate signal
   signal x;
   signal y;
   
   // output signal
   signal output q;

   // components
   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   // circuit  

   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

   notGate.in <== b;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;
   q <== orGate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = MyAwesomeCircuit();