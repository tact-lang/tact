// contract parameters with nested optional struct
struct Inner {
    x: Int?;
}

struct Outer {
    inner: Inner?;
}

contract ParamContract(
    data: Outer?,
    id: Int
) {
    receive() {
        let _ = self.data;
        let _ = self.id;
    }
}