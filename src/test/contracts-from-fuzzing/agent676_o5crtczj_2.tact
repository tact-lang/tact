struct Inner {
    b: Bool;
    i: Int;
    opt_i: Int?;
}

struct Middle {
    inn: Inner;
    text: String;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{
                inn: Inner{b: true, i: 7, opt_i: null},
                text: "hi"
            },
            flag: false
        };
    }
}