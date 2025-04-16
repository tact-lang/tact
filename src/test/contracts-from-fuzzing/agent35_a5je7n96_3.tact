struct InnerStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    z: Int;
}

contract TestContract {
    receive() {
        let inner_value = InnerStruct { x: 10, y: 20 };
        let outer_value = OuterStruct { inner: inner_value, z: 30 };
        let result = outer_value.inner.x + outer_value.z;
    }
}
