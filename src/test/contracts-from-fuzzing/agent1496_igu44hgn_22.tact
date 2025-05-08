struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    arr0: Int;
    arr1: Bool;
    arr2: Inner;
    arr3: Int;
    arr4: Bool;
    arr5: Inner;
    init() {
        self.arr0=0;
        self.arr1=false;
        self.arr2=Inner{ x:1, y:true };
        self.arr3=3;
        self.arr4=true;
        self.arr5=Inner{ x:5, y:false };
    }
}