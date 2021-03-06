# 集装箱号校验

## 箱号编码的构成

集装箱箱号编码由11位编码组成，包括三个部分：

* 第一部分由4位英文字母组成。这一部分又可分为两部分，分别是（前3位）箱主代码（Owner Code)，表明集装箱的经营人是谁，需要由集装箱所有人自定义并且向国际集装箱局登记注册；第二部分为类型代码（第4位），包括：U（常规集装箱）、J（带有可拆卸设备）、Z（带拖车喝底盘车的集装箱）。本文以常规集装箱为例进行分析。

* 第二部分由6位阿拉伯数字组成。这一部分称为箱体注册码（Registration Code），或顺序号（Serial Number），是一个集装箱箱体持有的唯一标识。如果不够六位，那么就用0在前面补齐，比如一家箱主的第一个箱子，可能就是000001。

* 第三部分是1位阿拉伯数字，为校验码（CheckDigit）。通常在箱体上加以方框用以区别于箱体注册码。它是检验箱主代号和顺序号记录是否准确的依据，由前4位字母和6位数字经过校验规则运算得出。



## 箱号的校验规则

根据校验规则，箱号的每个字母与数值都有一个用作运算的对应数值，见下表：
A=10 B=12 C=13 D=14 E=15 F=16 G=17 H=18 I=19 J=20 K=21 L=23 M=24 N=25 O=26 P=27 Q=28 R=29 S=30 T=31 U=32 V=34 W=35 X=36 Y=37 Z=38

公式：第N位的箱号对应值乘以2^（N－1） （N＝1，2，3………10）

以箱号“ZGLU3195510”为例，前4个字分别对应的值为：38，17，23，32。

- Z = 38 * 2 ^ 0 = 38
- G = 17 * 2 ^ 1 = 17
- …
- 1 = 1 * 2 ^ 9 = 512

以此类推，一直到第十位计算完成，也就是第六个数字计算完成，然后把这些值累加，为3508。

校验规则：将累加值与11取模。

3508对11取模就是10，当余数为10时需要再对10取模，也就是说我们的最后一个数字（校验码）应当是0。

注意：对11取模后余数可能为两位，如为10时，那么我们就需要再次对10取模，所以我们可以先对11取模，再对10取模。
