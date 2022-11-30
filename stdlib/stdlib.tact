primitive Int;
primitive Bool;
primitive Builder;
primitive Slice;
primitive Cell;

@name(begin_cell)
native beginCell(): Builder;

@name(store_int)
native storeInt(self Builder, value: Int, bits: Int): Builder;

@name(end_cell)
native endCell(self Builder): Cell;