struct Data {
    value: Int;
}

struct NestedMap {
    data: map<Int, Data>;
}

contract TestNestedMap {
    receive() {
        let nm: NestedMap = NestedMap { data: emptyMap() };
        nm.data.set(1, Data { value: 100 });
        nm.data.set(2, Data { value: 200 });
    }
}
