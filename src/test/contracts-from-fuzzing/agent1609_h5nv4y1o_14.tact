// nested optional struct field with serialization spec
struct Inner {
    val: Int? as int32;
    txt: String;
}

struct Outer {
    some: Inner?;
    other: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            some: Inner{
                val: null,
                txt: "hi"
            },
            other: true
        };
    }

    receive() {
        self.data = Outer{
            some: null,
            other: false
        };
    }
}