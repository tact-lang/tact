fun test(): Int {
    let a = false ? 1 : false ? 2 : 3;
    return a;
}

contract TestC {
    receive() {
       test();
    }
}
