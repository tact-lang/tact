const m = emptyMap<Int as int32, Int as int32>();

struct MapLen<K, V> {
    m: map<K, V>;
    l: Int as uint32;
    // fun get<A>(self: MapLen<K, V>, key: K): V? {
    //     return self.m.get(key);
    // }
}

extends fun get<K, V>(self: MapLen<K, V>, key: K): V? {
    return self.m.get(key);
}

extends mutates fun set<K, V>(self: MapLen<K, V>, key: K, value: V) {
    if (self.m.has(key)) {
        self.m.set(key, value);
        if (value == null) {
            self.l -= 1;
        }
    } else {
        self.m.set(key, value);
        if (value != null) {
            self.l += 1;
        }
    }
}

// template <class K, class V>
// std::optional<V> MapLen<K, V>::get(key: K) {
// }

// const m = f < x > (1);
// const m =(f < x)> (1);

// fun f<in T extends X super Y>() {}

// fun f<A, B>(a: A, b: B) {}
// fun g<X, Y>(x: X, y: Y) {
//     f(x, y);
//     f(y, x);
// }