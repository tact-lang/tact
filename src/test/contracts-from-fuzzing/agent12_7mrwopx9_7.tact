struct Point { x: Int; y: Int; }

contract TestStruct {
    fun show() {
       let p = Point{ x: 10, y: 20 };
       dump(p.x);
       dump(p.y);
    }
    
    receive() { self.show(); }
}
