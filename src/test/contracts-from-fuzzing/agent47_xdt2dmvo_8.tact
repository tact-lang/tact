struct WithMap {
    m: map<Int, Int>;
}

contract TestContract {
    receive() {
        let inst: WithMap = WithMap { m: emptyMap() };
        inst.m.set(1, 100);
        inst.m.get(1);
    }
}
