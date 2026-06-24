struct L3 {
    z: String;
    q: Int?;
}

struct L2 {
    inner: L3;
    flag: Bool;
}

struct L1 {
    nested: L2;
    note: String?;
}

contract TestContract {
    data: L1 = L1{
        nested: L2{
            inner: L3{
                z: "deep",
                q: null
            },
            flag: true
        },
        note: "hi"
    };

    receive() {
        let _ = self.data.nested.inner.z;
    }
}