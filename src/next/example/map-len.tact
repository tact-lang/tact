struct MapL<K, V> {
    m: map<K, V>;
    l: uint16;
}

extends fun get<K, V>(self: MapL<K, V>, key: K): V? {
    return self.m.get(key);
}

extends mutates fun set<K, V>(self: MapL<K, V>, key: K, value: V) {
    if (!self.m.exists(key)) {
        self.l += 1;
    }
    self.m.set(key, value);
}

message Set {
    key: uint8;
    value: uint8;
}

contract Test {
    state: MapL<uint8, uint8>;
    receive(msg: Set) {
        self.state.set(msg.key, msg.value);
    }
    get fun state(): MapL<uint8, uint8> {
        return self.state;
    }
}
