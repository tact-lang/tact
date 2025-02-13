asm fun throw(code: Int) { THROW }
asm fun throwIf(code: Int, condition: Bool) { THROWARGIF }
asm fun throwUnless(code: Int, condition: Bool) { THROWARGIFNOT }

// for backward compatibility (will be removed in Tact 2.0)

asm fun nativeThrow(code: Int) { THROW }
asm fun nativeThrowIf(code: Int, condition: Bool) { THROWARGIF }
asm fun nativeThrowUnless(code: Int, condition: Bool) { THROWARGIFNOT }
