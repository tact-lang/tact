struct Sample {
    a: Int;
    b: Bool;
    c: String;
}

contract DefaultStructInit {
    s: Sample;

    init() {
        self.s = Sample{
            a: 5,
            b: false,
            c: "hello"
        };
    }

    receive() {
        let _=self.s;
    }
}