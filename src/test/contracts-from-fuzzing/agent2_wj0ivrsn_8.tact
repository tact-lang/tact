contract Implicit {}

contract TestImplicit {
    receive() {
        let state = initOf Implicit();
        let code = codeOf Implicit;
    }
}
