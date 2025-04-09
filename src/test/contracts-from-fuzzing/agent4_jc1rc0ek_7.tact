struct WithMap {
    m: map<Int, Int>;
}

struct Nest {
    optional_value: Int?;
    inner_map: WithMap;
}

contract TestDeepNestedMap {
    receive() {
        let n = Nest{
            optional_value: 42,
            inner_map: WithMap{ m: emptyMap() },
        };
        n.inner_map.m;
    }
}
