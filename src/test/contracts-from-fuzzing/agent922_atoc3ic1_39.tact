// nested complex optional structs as contract parameter
struct S { x: Int; y: Bool?; z:String } 
struct W { a:S; b:S? }
contract CC( f:W?, s:S? ) {}