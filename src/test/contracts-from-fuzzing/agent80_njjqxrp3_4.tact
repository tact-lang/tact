contract Simple {
    receive() {}
}

contract ValidTest {
    receive() {
         let a = initOf Simple();
         let b = codeOf Simple;
    }
}
