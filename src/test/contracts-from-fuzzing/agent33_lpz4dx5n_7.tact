struct WithMap {
    items: map<Int, Int>;
}

contract TestContract {
    receive() {
        let wm: WithMap = WithMap {
            items: emptyMap()
        };
        wm.items.set(1, 100);
    }
}
