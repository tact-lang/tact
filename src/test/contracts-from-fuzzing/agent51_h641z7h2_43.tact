// optional in nested struct with default value assigned
struct Some {
 q:Int?;
}

contract Test {
 s:Some;
 init(){ self.s = Some{ q:null }; }
}