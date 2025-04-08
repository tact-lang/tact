// test nested default optional everywhere
struct Inn {
 x:Int? = null;
}
struct Out {
 inn:Inn? = null;
}
contract NestedDefaults {
 d:Out? = null;
 init() {}
}