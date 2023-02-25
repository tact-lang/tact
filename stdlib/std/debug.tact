@name(throw)
native nativeThrow(code: Int);

@name(throw_when)
native nativeThrowWhen(code: Int, condition: Bool);

@name(throw)
native throw(code: Int);

@name(throw_unless)
native nativeThrowUnless(code: Int, condition: Bool);

@name(dump_stack)
native dumpStack();