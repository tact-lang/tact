struct SInner { f: Int; g: Int; }

contract Overlay {
    arr1: SInner;
    arr2: SInner;

    init() {
        self.arr1 = SInner{f:1,g:2};
        self.arr2 = SInner{f:3,g:4};
    }
}