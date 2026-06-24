struct Point {
    x: Int;
    y: Int;
}

contract Destruct {
    receive() {
        // Destructuring assignment from a struct instance
        let Point { x, y } = Point{ x: 10, y: 20 };
        dump(x + y);
    }
}
