struct List1 { a:Int; b:Int; c:Int; d:Int; e:Int; }
struct List2 { f:Int; g:Int; h:Int; i:Int; j:Int; }

contract Bunch {
    l1: List1;
    l2: List2;

    init() {
        self.l1=List1{a:1,b:2,c:3,d:4,e:5};
        self.l2=List2{f:6,g:7,h:8,i:9,j:10};
    }
}
