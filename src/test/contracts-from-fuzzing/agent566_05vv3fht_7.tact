struct Frog {
    a: Int;
    b: Bool;
    c: String;
}

contract DefaultsTest {
    data: Frog = Frog{ a: 5, b: true, c: "hi" };
    num: Int = 42;
    txt: String = "ok";
    flag: Bool = false;

    init() {
        self.data = Frog{ a: 10, b: false, c: "bye" };
        self.num = 100;
        self.txt = "done";
        self.flag = true;
    }
}
