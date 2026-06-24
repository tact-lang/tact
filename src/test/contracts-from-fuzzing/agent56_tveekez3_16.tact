struct MyPair { x: Int; y: Int; z: Int; }

contract TestDestructIgnore {
    receive() {
        let p: MyPair = MyPair { x: 1, y: 2, z: 3 };
        let MyPair { x, .. } = p;
        dump(x);
    }
}
