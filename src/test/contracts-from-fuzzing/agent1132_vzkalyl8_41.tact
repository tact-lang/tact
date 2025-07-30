const CONST_VAL: Int = 5;

struct Data {
    a: Int; 
    b: Bool; 
    c: Int?; 
    d: Int = CONST_VAL;
}

contract WithConsts {
    d: Data = Data{a: 1, b: false, c: null};
}