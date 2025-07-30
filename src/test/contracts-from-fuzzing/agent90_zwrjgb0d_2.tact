contract Test {
    receive() {}
}

contract UseInitAndCode {
    receive() {
       let s = initOf Test();
       let c = codeOf Test;
    }
}
