struct Mixed {
    x: Int;
    y: Bool?;
    label: String;
    flag: Bool;
    child: ChildStruct?;
}

struct ChildStruct {
    count: Int;
    note: String?;
}

contract MixedStructFields {
    m: Mixed;

    init() {
        self.m = Mixed {
            x: 77,
            y: null,
            label: "ok",
            flag: true,
            child: null
        };
    }
}