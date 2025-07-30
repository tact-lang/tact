struct MyStruct {
    msg: String
}

fun doSomething(m: MyStruct): String {
    return m.msg;
}

contract Test {
    receive() {
        let x = MyStruct { msg: "Hello" };
        let y = doSomething(x);
        dump(y);
    }
}