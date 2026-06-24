// Field ordering with mixed optionals and non-optional initializes
struct A { a:Int?; b:Int; c:Bool?; d:String; e:String?; }

contract OrderTest {
    x:A;

    init() {
        self.x = A{a:null,b:1,c:null,d:"d",e:null};
    }
}