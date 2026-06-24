struct Point { x: Int; y: Int; }

contract TestStruct {
    fun test() {
        let p: Point = Point{ x: 10, y: 20 };
        dump(p.x); // should dump 10
        dump(p.y); // should dump 20
    }
    
    receive() {}
}
