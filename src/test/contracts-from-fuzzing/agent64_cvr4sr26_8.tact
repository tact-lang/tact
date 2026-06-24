contract TrailingInitTest {
    init(a: Int, b: Int,) {
    }
    receive() {}
}

contract TestTrailingInitTest {
    receive() {
         let s = initOf TrailingInitTest(1, 2,);
         let c = codeOf TrailingInitTest;
    }
}
