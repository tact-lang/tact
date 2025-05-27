primitive Int;

message Foo {
    m: map<Int, Int>;
}

asm fun foo(): bounced<Foo> { NOP }

fun bar() {
    let res = foo();
    dump(res.m);
}
