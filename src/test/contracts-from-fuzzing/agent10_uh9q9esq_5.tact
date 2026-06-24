struct Handler { f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; f6: Int; f7: Int }

// This assembly function will try to capture 7 values from the stack,
// though TVM initialization only provides fewer values.
asm fun overHandler(): Handler { }