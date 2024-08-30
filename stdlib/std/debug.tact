// these are builtin functions, these get special treatment from FunC
// hence, no asm here

@name(throw)
native nativeThrow(code: Int);

@name(throw_if)
native nativeThrowIf(code: Int, condition: Bool);

@name(throw)
native throw(code: Int);

@name(throw_unless)
native nativeThrowUnless(code: Int, condition: Bool);