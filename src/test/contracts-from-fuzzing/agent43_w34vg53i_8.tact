struct Entry {
    value: Int;
}

struct Container {
    entries: map<Int, Entry>;
}

contract MapNestedTest {
    receive() {
        let c: Container = Container { entries: emptyMap() };
        c.entries.set(1, Entry { value: 123 });
        c.entries.get(1)!!.value;
    }
}
