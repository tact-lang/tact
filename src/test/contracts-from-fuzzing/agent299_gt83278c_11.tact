struct Innermost {
    data: String;
}

struct Inner {
    info: Innermost?;
    count: Int;
}

struct Outer {
    detail: Inner?;
    note: String;
}

contract TestContract {
    complex: Outer;

    init() {
        self.complex = Outer{
            detail: Inner{
                info: null,
                count: 5
            },
            note: "nested optional check"
        };
    }
}