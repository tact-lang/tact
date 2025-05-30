contract DeepMixed {
    main: Outer;

    init() {
        self.main = Outer{
            sub: Sub{
                info: Info{
                    num: 42,
                    flag: true,
                    label: "xyz",
                    optS: null,
                    optB: false
                },
                text: "hello"
            },
            ok: true
        };
    }
}

struct Outer {
    sub: Sub;
    ok: Bool;
}

struct Sub {
    info: Info;
    text: String;
}

struct Info {
    num: Int;
    flag: Bool;
    label: String;
    optS: String?;
    optB: Bool?;
}
