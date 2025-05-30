struct Inner {
    value: Int;
}

struct Middle {
    inner_map: map<Int, Inner>;
}

struct Outer {
    middle: Middle;
}

contract TestNestedMap2 {
    receive(msg: Slice) {
        // Initialize an empty map
        let m: map<Int, Inner> = emptyMap();
        // Insert a key-value pair using the correct .set() method
        m.set(1, Inner { value: 999 });
        // Construct the nested structure
        let outer: Outer = Outer { middle: Middle { inner_map: m } };
        // Retrieve and check the value from the map
        let res: Inner? = outer.middle.inner_map.get(1);
        if (res!! .value == 999) {
            // Successfully accessed the nested field
        }
    }
}
