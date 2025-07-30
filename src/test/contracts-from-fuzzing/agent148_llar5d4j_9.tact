contract IamEmptyAndIKnowIt {}

contract TestEmpty {
    receive() {
         let s = initOf IamEmptyAndIKnowIt();
         let c = codeOf IamEmptyAndIKnowIt;
    }
}
