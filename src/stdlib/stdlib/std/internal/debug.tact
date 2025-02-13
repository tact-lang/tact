asm fun throw() { THROW }
asm fun throwIf() { THROWARGIF }
asm fun throwUnless() { THROWARGIFNOT }

// for backward compatibility (will be removed in Tact 2.0)

asm fun nativeThrow() { THROW }
asm fun nativeThrowIf() { THROWARGIF }
asm fun nativeThrowUnless() { THROWARGIFNOT }
