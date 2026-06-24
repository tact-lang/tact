struct L3 {
    c: Int;
    flag: Bool;
    label: String;
}
struct L2 {
    b: L3;
    num: Int;
    done: Bool;
}
struct L1 {
    a: L2;
    name: String;
    active: Bool;
}

contract DeepComplex {
    data: L1;

    init() {
        self.data = L1{
            a: L2{
                b: L3{ c: 1, flag: true, label: "low" },
                num: 2,
                done: false
            },
            name: "top",
            active: true
        };
    }

    receive() {}
}