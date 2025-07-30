// optional contract param with nested struct
struct Foo {
 x:Int;
 y:Bool?;
}
contract OptParamStruct(
 val: Foo?,
) {}
