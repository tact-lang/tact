struct AB { a: Int; b: Int }
struct Nested { ab: AB; c: Int }
struct SliceInt { s: Slice; val: Int }
struct Builder2 { dummy: Int }

// Valid asm functions
asm fun answer(): Int { 42 PUSHINT }

asm fun compute(): Int { 1 2 ADD }

asm fun mixTest(): Int { 3 4 ADD 5 MUL }

asm fun depthOfStack(): Int { DEPTH }

asm fun dropTwo(): Int { 1 2 2DROP }

asm inline fun inlineTest(): Int { 1 2 ADD }

asm fun dupTest(): Int { DUP }

// Assembly function with structured parameter flattening
asm fun addNested(n: Nested): Int { ADD ADD }

// Assembly function with argument arrangement on parameters
asm(c self) extends fun asmStoreDict2(self: Builder2, c: Cell?): Builder2 { STDICT }

// A main function (with explicit return type) to showcase usage of asm functions
fun main() : Int {
    let a = answer();          // expect 42
    let c = compute();           // expect 3
    let m = mixTest();           // expect 35
    let d = depthOfStack();      // returns current stack depth
    let dt = dropTwo();          
    let it = inlineTest();       
    let dup = dupTest();         
    let nval = addNested(Nested { ab: AB { a: 3, b: 4 }, c: 5 });  // expect 12
    return c;
}
