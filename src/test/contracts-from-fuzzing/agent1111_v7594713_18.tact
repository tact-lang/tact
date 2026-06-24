struct S {
 x:Int;
 y:Int;
}

contract TwoDefaults {
 s1:S = S{x:1,y:2};
 s2:S = S{x:3,y:4};
 init() {}
}