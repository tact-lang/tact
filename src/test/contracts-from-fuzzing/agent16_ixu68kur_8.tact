struct Inner {
    a: Int
}

struct Mega {
    i1: Inner;
    i2: Inner;
    i3: Inner;
    i4: Inner;
    i5: Inner;
    i6: Inner;
    i7: Inner;
    i8: Inner;
    i9: Inner;
    i10: Inner
}

fun sumMega(m: Mega): Int {
    return m.i1.a + m.i2.a + m.i3.a + m.i4.a + m.i5.a +
           m.i6.a + m.i7.a + m.i8.a + m.i9.a + m.i10.a;
}

contract TestMegaNestedStruct {
    receive() {
         let inner: Inner = Inner{ a: 10 };
         let mega: Mega = Mega{
             i1: inner,
             i2: inner,
             i3: inner,
             i4: inner,
             i5: inner,
             i6: inner,
             i7: inner,
             i8: inner,
             i9: inner,
             i10: inner
         };
         sumMega(mega);
    }
}
