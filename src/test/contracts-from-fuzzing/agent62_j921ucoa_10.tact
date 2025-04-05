struct DeepOptionalMapInner {
    value: Int?;
}

struct DeepOptionalMapOuter {
    entries: map<Int, DeepOptionalMapInner>;
}

contract TestDeepOptionalMap {
    receive() {
        let d = DeepOptionalMapOuter { entries: emptyMap() };
        d.entries.set(1, DeepOptionalMapInner { value: 123 });
        d.entries.get(1)!!.value;
    }
}
