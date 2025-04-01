primitive StringBuilder;
primitive Int;

trait BaseTrait {}

@name(__tact_string_builder_start_string)
native beginString(): StringBuilder;

contract Foo {
    get fun foo(): Int {
        dump(beginString());
        return 0;
    }
}
