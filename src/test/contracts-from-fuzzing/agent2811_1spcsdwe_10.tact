struct NestedInits {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract DefaultsTest {
    val: NestedInits = NestedInits{
        i:5,b:true,s:"hello",o:null
    };
}