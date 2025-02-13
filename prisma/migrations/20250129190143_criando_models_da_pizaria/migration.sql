-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "CreateDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "UpdateDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "description" TEXT NOT NULL,
    "banner" TEXT NOT NULL,
    "CreateDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "UpdateDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "category_id" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pedidos" (
    "id" TEXT NOT NULL,
    "mesa" INTEGER NOT NULL,
    "ativo" BOOLEAN NOT NULL,
    "rascunho" BOOLEAN NOT NULL,
    "name" TEXT,
    "CreateDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "UpdateDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "pedidos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "items" (
    "id" TEXT NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "CreateDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "UpdateDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "pedidos_id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,

    CONSTRAINT "items_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "items" ADD CONSTRAINT "items_pedidos_id_fkey" FOREIGN KEY ("pedidos_id") REFERENCES "pedidos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "items" ADD CONSTRAINT "items_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
