primitive Builder;
primitive Cell;
primitive Slice;
primitive Int;

trait BaseTrait {}

asm fun beginCell(): Builder { NEWC }
asm extends fun endCell(self: Builder): Cell { ENDC }
asm extends fun beginParse(self: Cell): Cell { CTOS }

fun returnVoid() {}
fun returnOptionalInt(): Int? { return null }

contract Foo {
    get fun foo(): Int {
        dump(0);
        dump(true);
        dump("hello");
        dump(address("hello"));
        dump(beginCell());
        dump(beginCell().endCell());
        dump(beginCell().endCell().beginParse());

        dump(null);
        dump(returnVoid());
        dump(returnOptionalInt());

        let m: map<Int, Int> = emptyMap();
        dump(m);
        return 0;
    }
}
