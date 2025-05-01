struct Set<K> {
    m: map<K, Bool>;
}

extends mutates fun add<K>(self: Set<K>, key: K) {
    self.m.set(key, true);
}

extends fun exists<K>(self: Set<K>, key: K): Bool {
    return self.m.exists(key);
}

message Add {
    key: uint8;
}

contract Test {
    state: Set<uint8>;
    receive(msg: Add) {
        self.state.add(msg.key);
    }
    get fun exists(key: uint8): Bool {
        return self.state.exists(key);
    }
}
