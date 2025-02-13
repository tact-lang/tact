asm fun throw() { THROW }
asm fun throwIf() { THROWARGIF }
asm fun throwUnless() { THROWARGIFNOT }

// for backward compatibility

asm fun nativeThrow() { THROW }
asm fun nativeThrowIf() { THROWARGIF }
asm fun nativeThrowUnless() { THROWARGIFNOT }
