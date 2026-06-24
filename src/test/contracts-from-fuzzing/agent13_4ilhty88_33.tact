struct Obj { x: Int?; y: Int }

contract TestOptionalDestructure {
    receive() {
        let obj: Obj = Obj { x: 123, y: 456 };
        let Obj { x, y } = obj;
        // Use non-null assertion on x, then add y.
        dump(x!! + y); // expecting 579
    }
}
