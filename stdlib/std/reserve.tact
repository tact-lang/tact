asm fun nativeReserve(amount: Int, mode: Int) { RAWRESERVE }

const ReserveExact: Int = 0;
const ReserveAllExcept: Int = 1;
const ReserveAtMost: Int = 2;
const ReserveAddOriginalBalance: Int = 4;
const ReserveInvertSign: Int = 8;
const ReserveBounceIfActionFail: Int = 16;